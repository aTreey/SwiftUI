#!/bin/sh
###
# @Author: aTreey 480814177@qq.com
# @Date: 2022-11-08 00:12:39
# @LastEditors: aTreey 480814177@qq.com
# @LastEditTime: 2022-11-08 00:49:37
# @FilePath: /undefined/Users/yuhongpeng/Dev/LoginOC/changeCommitMsg.sh
# @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
###

git filter-branch --env-filter '

# 之前用户名
OLD_NAME="于鸿鹏"
# 之前的邮箱
OLD_EMAIL="hongpeng03@gmail.com"
# 修改后的用户名
CORRECT_NAME="480814177"
# 修改后的邮箱
CORRECT_EMAIL="480814177@qq.com"

if [ "$GIT_AUTHOR_NAME" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
fi

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
