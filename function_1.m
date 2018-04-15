%% 通用函数1
function int_class = function_1(conf_initial, conf_modifier, conf_noise, conf_stu, conf_begin_1_len, conf_begin_2_len, conf_begin_bias, conf_over_1_len, conf_over_2_len, conf_over_bias, conf_file)
    t = 0:0.125:9;
    %时间轴
    per_class_t1_begin = -1:0.125:-0.5;
    per_class_t2_begin = -0.375:0.125:1;
    per_class_t1_over = -1:0.125:0;
    per_class_t2_over = 0.125:0.125:1;
    per_class_t = -1:0.125:1;
    %读取课程计划
    classes_time = csvread(conf_file);
    class_stu_modifier = 2.*conf_modifier + conf_modifier * rand(1,73);
    classes_begin = classes_time(1,:).*class_stu_modifier;
    classes_over = classes_time(2,:).*-class_stu_modifier;
    %生成每课正态分布
    per_class_begin = [conf_stu.*normpdf(per_class_t1_begin,conf_begin_bias,conf_begin_1_len) conf_stu.*normpdf(per_class_t2_begin,conf_begin_bias,conf_begin_2_len)];
    per_class_over = [conf_stu.*normpdf(per_class_t1_over,conf_over_bias,conf_over_1_len) conf_stu.*normpdf(per_class_t2_over,conf_over_bias,conf_over_2_len)];
    %计算卷积
    begin_class = conv(per_class_begin, classes_begin);
    over_class = conv(per_class_over, classes_over);
    total_class = begin_class + over_class;
    %绘制每课正态分布
    figure;
    subplot(2,1,1);plot(per_class_t, per_class_begin);
    subplot(2,1,2);plot(per_class_t, per_class_over);
    %随机背景噪音
    background = -conf_noise + 2.*conf_noise.*rand(1,89);
    total_class = total_class + background;
    %累积
    int_class = zeros(1,90);
    for i = 2:88
        int_class(i) = total_class(1,i) + int_class(1,i-1);
    end
    %初始值处理
    int_class = int_class + conf_initial;
    %绘制最终模型
    figure;
    plot((1:90)/5+6,int_class);
end