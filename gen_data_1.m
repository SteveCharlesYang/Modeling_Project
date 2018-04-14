%% 教学楼工作日
%% Definition
%每日初始值
conf_initial = 10;
%不同课程随机变化范围
conf_modifier = 0.4;
%背景噪声
conf_noise = 2;
%课程开始正态分布：
conf_begin_1_len = 0.14;
conf_begin_2_len = 0.24;
conf_begin_bias = -0.26;
%课程结束正态分布：
conf_over_1_len = 0.1;
conf_over_2_len = 0.24;
conf_over_bias = 0.25;
%%
t = 0:0.125:9;
per_class_t1_begin = -1:0.125:-0.5;
per_class_t2_begin = -0.375:0.125:1;
per_class_t1_over = -1:0.125:0;
per_class_t2_over = 0.125:0.125:1;
classes_time = csvread('class_time.csv');
class_stu_modifier = 2.*conf_modifier + conf_modifier * rand(1,73);
classes_begin = classes_time(1,:).*class_stu_modifier;
classes_over = classes_time(2,:).*-class_stu_modifier;
per_class_begin = [10.*normpdf(per_class_t1_begin,conf_begin_bias,conf_begin_1_len) 10.*normpdf(per_class_t2_begin,conf_begin_bias,conf_begin_2_len)];
per_class_over = [10.*normpdf(per_class_t1_over,conf_over_bias,conf_over_1_len) 10.*normpdf(per_class_t2_over,conf_over_bias,conf_over_2_len)];
begin_class = conv(per_class_begin, classes_begin);
over_class = conv(per_class_over, classes_over);
total_class = begin_class + over_class;
figure;
subplot(2,1,1);plot(per_class_t, per_class_begin);
subplot(2,1,2);plot(per_class_t, per_class_over);
background = -conf_noise + 2.*conf_noise.*rand(1,89);
total_class = total_class + background;
int_class = zeros(1,90);
for i = 2:88
    int_class(i) = total_class(1,i) + int_class(1,i-1);
end
int_class = int_class + conf_initial;
figure;
plot((1:90)/5+6,int_class);
