%% 教学楼节假日
%% Definition
%每日初始值
conf_initial = 10;
%不同课程随机变化范围
conf_modifier = 0.1;
%背景噪声
conf_noise = 2;
%人员相对值
conf_stu = 10;
%课程开始正态分布：
conf_begin_1_len = 0.3;
conf_begin_2_len = 0.2;
conf_begin_bias = 0;
%课程结束正态分布：
conf_over_1_len = 0.2;
conf_over_2_len = 0.3;
conf_over_bias = 0;
%读取文件
conf_file = 'self_time.csv';
%%
function_1(conf_initial, conf_modifier, conf_noise, conf_stu, conf_begin_1_len, conf_begin_2_len, conf_begin_bias, conf_over_1_len, conf_over_2_len, conf_over_bias, conf_file)
