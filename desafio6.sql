SELECT min(t1.price_plan) AS 'faturamento_minimo', max(t1.price_plan) AS 'faturamento_maximo', round(avg(t1.price_plan), 2) AS 'faturamento_medio', sum(t1.price_plan) AS 'faturamento_total'
FROM SpotifyClone.plan_tb t1
INNER JOIN SpotifyClone.user_tb t2 ON t1.id_plan = t2.id_plan;