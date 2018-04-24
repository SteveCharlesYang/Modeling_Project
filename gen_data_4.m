%% 宿舍工作日
%% Definition
%每日初始值
conf_initial = 200;
%不同课程随机变化范围
conf_modifier = 0.4;
%背景噪声
conf_noise = 2;
%人员相对值
conf_stu = 40;
%课程开始正态分布：
conf_begin_1_len = 0.24;
conf_begin_2_len = 0.34;
conf_begin_bias = 0.25;
conf_begin_offset = 0;
%课程结束正态分布：
conf_over_1_len = 0.2;
conf_over_2_len = 0.34;
conf_over_bias = -0.2;
conf_over_offset = 0;
%读取文件
conf_file = 'dorm_weekends.csv';
%写入文件
conf_write_file = 'ofo_end_dorm.csv';
%%
function_1(conf_begin_offset, conf_over_offset, conf_initial, conf_modifier, conf_noise, conf_stu, conf_begin_1_len, conf_begin_2_len, conf_begin_bias, conf_over_1_len, conf_over_2_len, conf_over_bias, conf_file, conf_write_file)
