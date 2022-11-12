# 记录自动生成

```
# 1. 把本项目clone到路径 /data/open-c3-change
# 2. 添加权限，主机可以git push
# 3. 添加定时任务
3 3 * * * /data/open-c3-change/tool/run > /tmp/open-c3-change.log 2>/tmp/open-c3-change.err
```
