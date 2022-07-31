/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   lexer.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sel-kham <sel-kham@student.1337.ma>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/07/31 18:51:17 by sel-kham          #+#    #+#             */
/*   Updated: 2022/07/31 18:58:47 by sel-kham         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LEXER_H
# define LEXER_H

struct s_lexter
{
	enum
	{
		INPUT_REDIR = '>',
		OUTPUT_REDIR = '<',
		APPEND = -62,
		HERDOC = -60,
		PIPE = '|',
		VARIABLE = '$',
		S_QUOTE = '\'',
		D_QUOTE = '"',
		AND_IF = -38,
		OR_IF = -124,
		L_PAR = '(',
		R_PAR = ')',
		WHITE_SPACE = ' ',
		EOL = 0
	}	e_token;
}	typedef t_lexer;


#endif