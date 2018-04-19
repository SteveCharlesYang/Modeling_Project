%% 数据处理函数
function [arg_pos, arg_neg, check] = process_data(read_file, compare_file, length_start, length_end, bias_start, bias_end)
    %读取文件并预处理
    data = csvread(read_file);
    data_check = csvread(compare_file);
    data_check1 = data_check(1,:);
    data_check2 = -data_check(2,:);
    check = data_check1 + data_check2;
    %将累计量差分成为变化率
    flow = diff(data);
    %将正负变化率分离
    flow_pos = (flow>0).*flow;
    flow_neg = (flow<0).*-flow;
    %定义坐标轴
    t = -10:10;
    %规定用以参考的正态分布
    normal_pos = normpdf(-1:0.1:1,bias_start,length_start);
    normal_neg = normpdf(-1:0.1:1,bias_end,length_end);
    %反卷积
    arg_pos = deconvlucy(flow_pos,normal_pos);
    arg_neg = deconvlucy(flow_neg,normal_neg);
end