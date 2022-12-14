NAME		:=
CC			:= cc
CFLAGS		:= -Wall -Werror -Wextra -I ./include

SERVER		:= server
CLIENT		:= client
OBJDIR		:= objects
SRCSDIR		:= src
CLIENTDIR	:= $(SRCSDIR)/client.c
SERVERDIR	:= $(SRCSDIR)/server.c
LIBFT_A		:= $(OBJDIR)/libft.a

all:$(OBJDIR) $(LIBFT_A) $(CLIENT) $(SERVER)

$(CLIENT):
	$(CC) $(CFLAGS) $(CLIENTDIR) $(LIBFT_A) -o $(CLIENT)

$(SERVER):
	$(CC) $(CFLAGS) $(SERVERDIR) $(LIBFT_A) -o $(SERVER)

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(LIBFT_A):
	make -C libft

$(OBJDIR)/%.o: $(SRCSDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

bonus: all

clean:
	rm -f $(OBJDIR)/*.o

fclean:
	rm -f $(LIBFT_A)
	rm -rf $(OBJDIR)
	rm -f client server

re: fclean all
