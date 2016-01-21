#include <iostream>
using namespace std;
const int MAX = 1000 + 10;
const int INF = INT_MAX;
struct EDGE
{
    int v;         // 边的一个端点为 v
    int w;         // 边的权值为 w
    int next;      // 从同一源点u出发的下一条边的编号
};
 
EDGE map[MAX*MAX];
bool vis[MAX][2];  // 访问标志
int dis[MAX][2];   // dis[i][0] = j：到点i的最短路为j   dis[i][1] = j：到点j的次短路为j
int cnt[MAX][2];   // cnt[i][0] = j：到点i的最短路为j   cnt[i][1] = j：到点j的次短路为j
int adj[MAX];      // adj[u] = v：从u点出发的最后一条边的编号
int n, m;          // 边数 点数
int eNum;          // 边的数目
 
// 函数说明：将权值为w的边(u，v)添加到图map中
void Add(int u, int v, int w)
{
    map[eNum].v = v;
    map[eNum].w = w;
    map[eNum].next = adj[u];
    adj[u] = eNum;
    eNum++;
}
 
void Dijkstra(int s, int t)
{
    int i;
    int u;
    int flag;

    memset(vis, 0, sizeof(vis));
    memset(cnt, 0, sizeof(cnt));
    for (i=1; i<=n; i++)
    {
        dis[i][0] = dis[i][1] = INF;
    }
    cnt[s][0] = 1;
    dis[s][0] = 0;
 
    for (i=1; i<2*n; i++)
    {
        // 找新的最短路和次短路 
        int min = INF;
        for (int j=1; j<=n; j++)
        {
            if (!vis[j][0] && dis[j][0] < min)
            {
                u = j;
                flag = 0;
                min = dis[j][0];
            }
            else if (!vis[j][1] && dis[j][1] < min)
            {
                u = j;
                flag = 1;
                min = dis[j][1];
            }
        }
        // 如果最短路和次短路都不存在，则退出for循环 
        if (min == INF)
        {
            break;
        }
        // 更新和点u相连的边 
        vis[u][flag] = 1;
        for (int k=adj[u]; k!=-1; k=map[k].next)
        {
            int w = map[k].w;
            int v = map[k].v;
            // 比最短路短 
            if (dis[v][0] > min+w)
            {
                dis[v][1] = dis[v][0];
                cnt[v][1] = cnt[v][0];
                dis[v][0] = min + w;
                cnt[v][0] = cnt[u][flag];
            }
            // 等于最短路 
            else if (dis[v][0] == min+w)
            {
                cnt[v][0] += cnt[u][flag];
            }
            // 比次短路短 
            else if (dis[v][1] > min+w)
            {
                dis[v][1] = min + w;
                cnt[v][1] = cnt[u][flag];
            }
            // 等于最短路 
            else if (dis[v][1] == min+w)
            {
                cnt[v][1] += cnt[u][flag];
            } 
        }
    }
 
    if (dis[t][1] == dis[t][0]+1)
    {
        cnt[t][0] += cnt[t][1];
    }
    cout << cnt[t][0] << endl;
}
 
int main()
{
    int casesNum;  // 测试数据的组数
    int u, v, w;
    int s, t;   // 起点终点
    cin >> casesNum;
    while (casesNum--)
    {
        memset(adj, -1, sizeof(adj));
        eNum = 0;
        cin >> n >> m;
        for (int i=0; i<m; i++)
        {
            cin >> u >> v >> w;
            Add(u, v, w);
        }
        cin >> s >> t;
        Dijkstra(s, t);
    }
    return 0;
}