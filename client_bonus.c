/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: msevuk <msevuk@student.42kocaeli.com.tr    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/02 02:03:26 by msevuk            #+#    #+#             */
/*   Updated: 2022/08/02 02:03:49 by msevuk           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft/libft.h"
#include <signal.h>
#include <unistd.h>

static void	action(int sig)
{
	static int	received = 0;

	if (sig == SIGUSR1)
	{
		++received;
	}
	else
	{
		ft_putnbr_fd(received, 1);
		ft_putchar_fd('\n', 1);
		exit(0);
	}
}

static void	mt_kill(int pid, char *str)
{
	int		i;
	char	c;

	while (*str)
	{
		i = 8;
		c = *str++;
		while (i--)
		{
			if (c >> i & 1)
				kill(pid, SIGUSR2);
			else
				kill(pid, SIGUSR1);
			usleep(100);
		}
	}
	i = 8;
	while (i--)
	{
		kill(pid, SIGUSR1);
		usleep(100);
	}
}

int	main(int argc, char **argv)
{
	if (argc > 2)
	{
		ft_putnbr_fd(getpid(), 1);
		ft_putchar_fd('\n', 1);
		ft_putstr_fd("sent	:", 1);
		ft_putnbr_fd(ft_strlen(argv[2]), 1);
		ft_putchar_fd('\n', 1);
		ft_putstr_fd("Received: ", 1);
		signal(SIGUSR1, action);
		signal(SIGUSR2, action);
		mt_kill(ft_atoi(argv[1]), argv[2]);
		while (1)
			pause();
		return (0);
	}
	return (1);
}
