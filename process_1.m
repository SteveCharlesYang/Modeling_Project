%% 教学楼工作日
%% Definition
%读取文件
read_file="ofo_work_teachingbuilding.csv";
%用以比较的生成数据
compare_file="class_time.csv";
%课程开始/结束的分布参数
length_start=0.2;
length_end=0.2;
bias_start=0;
bias_end=0;
%%
[list1, list2, check] = process_data(read_file, compare_file, length_start, length_end, bias_start, bias_end);
figure;
subplot(311);
stem(list1);
subplot(312);
stem(list2);
subplot(313);
stem(check);