uestc_road = [inf,inf,0.7,inf,0.3,inf,0.2;
         inf,inf,0.7,0.05,inf,0.05,0.2;
         0.03,0.6,inf,0.1,inf,0.07,0.2;
         inf,0.2,0.6,inf,inf,0.05,0.15;
         0.2,0.3,0.3,inf,inf,0.05,0.1;
         inf,0.15,0.6,0.05,0.05,inf,0.15;
         0.1,0.3,0.4,0.1,0.05,inf,inf;];
     a=[0,62,66,inf,inf,inf,inf;
      62,0,inf,25,11,inf,inf;
      66,inf,0,9,inf,inf,49;
      inf,25,9,0,11,14,inf;
      inf,11,inf,11,0,13,inf;
      inf,inf,inf,14,13,0,35.8;
      inf,inf,49,inf,inf,35.8,0;];
uestc_graph = digraph(uestc_road);
plot(uestc_graph);
findPath(uestc_road, 2, 3, 0)
 
function possiablePaths = findPath(Graph, partialPath, destination, partialWeight)
% findPath按深度优先搜索所有可能的从partialPath出发到destination的路径，这些路径中不包含环路
% Graph: 路网图，非无穷或0表示两节点之间直接连通，矩阵值就为路网权值
% partialPath: 出发的路径，如果partialPath就一个数，表示这个就是起始点
% destination: 目标节点
% partialWeight: partialPath的权值，当partialPath为一个数时，partialWeight为0
pathLength = length(partialPath);
lastNode = partialPath(pathLength); %得到最后一个节点
nextNodes = find(0<Graph(lastNode,:) & Graph(lastNode,:)<inf); %根据Graph图得到最后一个节点的下一个节点
GLength = length(Graph);
possiablePaths = [];
if lastNode == destination
 % 如果lastNode与目标节点相等，则说明partialPath就是从其出发到目标节点的路径，结果只有这一个，直接返回
 possiablePaths = partialPath;
 possiablePaths(GLength + 1) = partialWeight;
 return;
elseif ~isempty( find( partialPath == destination, 1 ) )
 return;
end
%nextNodes中的数一定大于0,所以为了让nextNodes(i)去掉，先将其赋值为0
for i=1:length(nextNodes)
 if destination == nextNodes(i)
  %输出路径
  tmpPath = cat(2, partialPath, destination);      %串接成一条完整的路径
  tmpPath(GLength + 1) = partialWeight + Graph(lastNode, destination); %延长数组长度至GLength+1, 最后一个元素用于存放该路径的总路阻
  possiablePaths( length(possiablePaths) + 1 , : ) = tmpPath;
  nextNodes(i) = 0;
 elseif ~isempty( find( partialPath == nextNodes(i), 1 ) )
  nextNodes(i) = 0;
 end
end
nextNodes = nextNodes(nextNodes ~= 0); %将nextNodes中为0的值去掉，因为下一个节点可能已经遍历过或者它就是目标节点
for i=1:length(nextNodes)
 tmpPath = cat(2, partialPath, nextNodes(i));
 tmpPsbPaths = findPath(Graph, tmpPath, destination, partialWeight + Graph(lastNode, nextNodes(i)));
 possiablePaths = cat(1, possiablePaths, tmpPsbPaths);
end
end
