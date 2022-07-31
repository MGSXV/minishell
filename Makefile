# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-kham <sel-kham@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/31 15:18:07 by sel-kham          #+#    #+#              #
#    Updated: 2022/07/31 16:04:27 by sel-kham         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Colors
RED := \033[0;31m
WHITE := \033[0;37m
GREEN := \033[0;32m
BLUE := \033[0;34m

# Code
## directories
INCLUDES_DIR := includes
SRC_DIR := src
OBJ_DIR := obj

## Includes Sub-directories
HEADERS_DIR := $(INCLUDES_DIR)/headers
LIBFT_DIR := $(INCLUDES_DIR)/libft

## SRC Sub-directories
INIT_DIR := $(SRC_DIR)/init
APP_DIR := $(SRC_DIR)/app
HELPERS_DIR := $(SRC_DIR)/helpers

## Compounents
LIBFT := $(LIBFT_DIR)/libft.a
HEADERS := minishell.h
HEADERS := $(addprefix $(HEADERS_DIR)/, $(HEADERS))

INIT := 
INIT := $(addprefix $(INIT_DIR)/, $(INIT))
HELPERS := 
HELPERS :=  $(addprefix $(HELPERS_DIR)/, $(HELPERS))

SRC := $(HELPERS) $(INIT) 
OBJ := $(addprefix $(OBJ_DIR)/, $(notdir $(SRC:.c=.o)))

MAIN := $(SRC_DIR)/main.c

READLINE := $(shell brew --prefix readline)
CFLAGS := -Wall -Wextra -Werror
IFLAGS := -I $(READLINE)/include
LFLAGS := -L $(READLINE)/lib -lreadline \
        -L $(READLINE)/lib -lhistory

REMOVE := rm -rf

NAME := minishell

.PHONY: all clean fclean re

all: $(NAME)

$(NAME):  $(MAIN) $(LIBFT) $(HEADERS) $(OBJ)
	@echo "$(GREEN)Making $(WHITE)Mini-Shell's executable..."
	@$(CC) $(CFLAGS) $(LFLAGS) $(IFLAGS) $(MAIN) $(LIBFT) $(OBJ) -o $@

$(OBJ_DIR)/%.o: $(INIT_DIR)/%.c
	@mkdir -p obj
	@echo "$(GREEN)Making $(WHITE)ini object files..."
	@$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: $(HELPERS_DIR)/%.c
	@mkdir -p obj
	@echo "$(GREEN)Making $(WHITE)helpers object files..."
	@$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@
	
$(LIBFT): $(shell find $(LIBFT_DIR) -name "*.c" -type f)
	@echo "$(GREEN)Making $(WHITE)libft files..."
	@$(MAKE) -C $(LIBFT_DIR)/

clean:
	@echo "$(RED)Removing $(WHITE)Mini-Shell object files..."
	@$(REMOVE) $(OBJ_DIR)
	@echo "$(RED)Removing $(WHITE)libft object files..."
	@$(MAKE) -C $(LIBFT_DIR)/ clean

fclean: clean
	@echo "$(RED)Removing $(WHITE)Mini-Shell executable file..."
	@$(REMOVE) $(NAME)
	@echo "$(RED)Removing $(WHITE)libft static library file..."
	@$(MAKE) -C $(LIBFT_DIR)/ fclean

re: fclean all