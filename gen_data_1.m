%% 教学楼工作日
%% Definition
%每日初始值
conf_initial = 10;
%不同课程随机变化范围
conf_modifier = 0.4;
%背景噪声
conf_noise = 2;
%人员相对值
conf_stu = 20;
%课程开始正态分布：
conf_begin_1_len = 0.14;
conf_begin_2_len = 0.24;
conf_begin_bias = -0.26;
conf_begin_offset = -0.5;
%课程结束正态分布：
conf_over_1_len = 0.1;
conf_over_2_len = 0.24;
conf_over_bias = 0.25;
conf_over_offset = 0;
%读取文件
conf_file = 'class_time.csv';
%写入文件
conf_write_file = 'ofo_work_teachingbuilding.csv';
%%
val = [];
val = [val;function_1(conf_begin_offset, conf_over_offset, conf_initial, conf_modifier, conf_noise, conf_stu, conf_begin_1_len, conf_begin_2_len, conf_begin_bias, conf_over_1_len, conf_over_2_len, conf_over_bias, conf_file, conf_write_file)];
