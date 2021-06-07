import random

post = open("post2.sql", "r")
comment = open("comment.sql", "r")
newComment = open("newComment.sql", "a")

postTuple = []


for x in post:
    lst = x.split("values")
    prop = lst[1].split(',')
    postTuple += [(prop[0].split('(')[1],prop[1])]

post.close()

commentId = []
for i in range(10001):
    commentId += [0]

for x in comment:
    y = x
    randomPost = random.randint(1, 1000)
    commentId[randomPost] = commentId[randomPost] + 1
    comment_id = commentId[randomPost]
    post_id = postTuple[randomPost][0]
    profile_id = postTuple[randomPost][1]
    part1 = y.split("values")
    part2 = part1[1].split(',')
    part2[0] = '(' + str(comment_id)
    part2[1] = post_id
    part2[2] = profile_id
    end = part1[0] + "values "
    for i in part2:
        end = end + i + ','
    end = end[0:len(end)-1]
    end = end.replace('MOCK_DATA', "post_comment")
    end = end.replace('content) ', "comment_content) ")
    newComment.write(end)

newComment.close()

