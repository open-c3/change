#!/bin/bash
git log --pretty=format:'%ai|%s' | grep -E 'u -|f -' | while IFS='|' read -r time msg; do
    # 将 ISO 时间字符串转为北京时间
    local_time=$(TZ=Asia/Shanghai date -d "$time" '+%Y-%m-%d %H:%M:%S')

    # 判断类型
    if [[ $msg =~ ^u\ - ]]; then
        type="更新"
        msg_clean=${msg#u - }
    elif [[ $msg =~ ^f\ - ]]; then
        type="修复"
        msg_clean=${msg#f - }
    else
        continue
    fi

    # 输出为 Markdown 表格格式
    echo "|$local_time|$type| $msg_clean |"
done
