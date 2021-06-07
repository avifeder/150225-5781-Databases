import random

def change_format_date(old):
  old_lst = old.split("-")
  year = old_lst[0]
  month = old_lst[1]
  day = old_lst[2].split(' ')[0]
  return " to_date('" + day + '-' + month + '-' + year + "', 'dd-mm-yyyy')"

f = open("post.sql", "r")
p = open("post1.sql", "a")

arr = []
for i in range(10001):
  arr.append(0)
c = 0
counter = 0
count = 0
for x in f:
  c += 1
  x = x.replace("date", "post_date")
  x = x.replace("content", "post_content")
  counter += 1
  count += 1
  if count % 1001 == 0:
    count = 1
  y = x
  profile_id = random.randint(1, 10000)
  arr[profile_id] += 1
  post_id = arr[profile_id]
  visability = random.randint(0 , 1)
  likes = random.randint(0, 2000)
  type = random.randint(0,1)
  group = 'NULL'
  if type == 0:
    group = random.randint(1, 500)
  lst = y.split("values")
  prop = lst[1].split(',')
  post_id_new = prop[0].replace(str(counter), str(post_id))
  profile_id_new = prop[1].replace(str(count), str(profile_id))
  date_new = change_format_date(prop[2].split("'")[1])
  visability_new = prop[3].replace(str(count), str(visability))
  likes_new = prop[4].replace(str(count), str(likes))
  type_new = prop[6].replace(str(count), str(type))
  group_new = prop[7].replace(str(count), str(group))
  y = "values".join([lst[0],','.join([post_id_new, profile_id_new, date_new, visability_new, likes_new, prop[5], type_new, group_new])])
  p.write(y)
  if c % 100 == 0:
    p.write("commit;\nprompt 100 records committed...\n")
p.close()
