SELECT nome_cancao AS nome_musica,
 CASE nome_cancao
 WHEN "The Bard’s Song" THEN  'The QA’s Song'
 WHEN "O Medo de Amar é o Medo de Ser Livre" 
 THEN "O Medo de Code Review é o Medo de Ser Livre"
 WHEN "Como Nossos Pais" THEN "Como Nossos Pull Requests"
 WHEN "BREAK MY SOUL" THEN "BREAK MY CODE"
 WHEN "ALIEN SUPERSTAR" THEN "ALIEN SUPERDEV"
 END AS 'novo_nome'
 From SpotifyClone.cancao
 ORDER BY novo_nome DESC
 LIMIT 5; 