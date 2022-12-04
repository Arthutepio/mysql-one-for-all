SELECT MIN(p.valor) AS "faturamento_minimo",
	     MAX(p.valor) AS "faturamento_maximo",
       FORMAT(AVG(p.valor), 2) AS "faturamento_medio",
       SUM(p.valor) "faturamento_total"
FROM SpotifyClone.plano AS p,
	 SpotifyClone.usuario AS u
WHERE p.id_plano = u.id_plano;