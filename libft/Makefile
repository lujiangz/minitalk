# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: msevuk <msevuk@student.42kocaeli.com.      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/20 01:53:59 by msevuk            #+#    #+#              #
#    Updated: 2022/02/22 17:00:48 by msevuk           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
FLAG = -Wall -Wextra -Werror
OPTION = -c
SRC = $(shell find . ! -name "ft_lst*.c" -name "ft_*.c")
BONUS = *.c

all: $(NAME)

$(NAME):
	gcc $(FLAG) $(OPTION) $(SRC)
	ar rc $(NAME) *.o
bonus:
	gcc $(FLAG) $(OPTION) $(BONUS)
	ar rc $(NAME) *.o
clean:
	rm -f  *.o
fclean: clean
	rm -f $(NAME)
re: fclean all
