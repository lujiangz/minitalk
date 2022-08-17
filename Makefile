FLAGS = -Wall -Werror -Wextra
LIBFT_PATH = libft/Makefile
AR_PATH = libft/libft.a
NAME_CL = client
NAME_SV = server
BONUS_CL= client_bonus
BONUS_SV= server_bonus

libmake:
	@cd libft && make all
	@cd libft && make clean
all: libmake $(NAME_CL) $(NAME_SV)

$(NAME_CL): libmake
	@gcc $(FLAGS) -o client client.c $(AR_PATH)
$(NAME_SV): libmake
	@gcc $(FLAGS) -o server server.c $(AR_PATH)
bonus: libmake $(BONUS_CL) $(BONUS_SV)

$(BONUS_CL): libmake
	@gcc $(FLAGS) client_bonus.c $(AR_PATH) -o $(BONUS_CL)
$(BONUS_SV): libmake
	@gcc $(FLAGS) server_bonus.c $(AR_PATH) -o $(BONUS_SV)
clean:
	@rm -rf $(NAME_CL) $(NAME_SV)
	@rm -rf $(BONUS_CL) $(BONUS_SV)
	@cd libft && make fclean
fclean: clean
re: clean all
