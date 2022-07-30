# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/06 12:06:46 by chanheki          #+#    #+#              #
#    Updated: 2022/07/23 04:57:48 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME		:=	libft.a
SRC			:=	ft_memset.c ft_bzero.c ft_memcpy.c\
				ft_memmove.c ft_memchr.c ft_memcmp.c ft_strlen.c\
				ft_strlcpy.c ft_strlcat.c ft_strchr.c ft_strrchr.c\
				ft_strnstr.c ft_strncmp.c ft_atoi.c ft_isalpha.c\
				ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c\
				ft_toupper.c ft_tolower.c ft_calloc.c ft_strdup.c\
				\
				ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c\
				ft_itoa.c ft_strmapi.c ft_putchar_fd.c ft_putstr_fd.c\
				ft_putendl_fd.c ft_putnbr_fd.c
OBJ			:=	$(SRC:.c=.o)

BONUS_SRC	:=	ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c\
				ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c\
				ft_lstmap.c
BONUS_OBJ	:=	$(BONUS_SRC:.c=.o)

CFLAGS		:=	-Wall -Wextra -Werror
CC			:=	GCC

ifdef WITH_BONUS
	OBJECTS = $(OBJ) $(BONUS_OBJ)
else
	OBJECTS = $(OBJ)
endif

.PHONY:		all bonus clean fclean re

all:		$(NAME)

$(NAME):	$(OBJECTS)
	ar -rc $@ $^

bonus:
	@make WITH_BONUS=1 all

*.o:		*.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -f $(OBJ) $(BONUS_OBJ)

fclean:		clean
	@rm -f $(NAME)

re:			fclean all