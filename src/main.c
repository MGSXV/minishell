/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sel-kham <sel-kham@student.1337.ma>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/07/31 15:32:40 by sel-kham          #+#    #+#             */
/*   Updated: 2022/07/31 16:13:02 by sel-kham         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/headers/minishell.h"

int	main(int ac, char **av, char **env)
{
	char	*cmd_line;

	av[0][1] = ac;
	env =NULL;
	while (1)
	{
		cmd_line = readline("\033[0;34mMinishell ► \033[0;37m");
		
	}
}
