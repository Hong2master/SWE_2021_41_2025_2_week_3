FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y python3

CMD ["python3", "-c", "\
def isHappy(n):\n\
  def get_next(number):\n\
    total_sum = 0\n\
    while number > 0:\n\
      number, digit = divmod(number, 10)\n\
      total_sum += digit ** 2\n\
    return total_sum\n\
\n\
  history = set()\n\
  while n != 1 and n not in history:\n\
    history.add(n)\n\
    n = get_next(n)\n\
\n\
  return n==1\n\
\n\
print(isHappy(19))\n\
print(isHappy(2))\
"]

