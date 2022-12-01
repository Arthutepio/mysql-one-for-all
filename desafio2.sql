SELECT COUNT(id_cancao) AS cancoes,
(SELECT COUNT(id_artista) FROM SpotifyClone.artista) AS artistas,
(SELECT COUNT(id_album) FROM SpotifyClone.album) AS albuns 
FROM SpotifyClone.cancao;