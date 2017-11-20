-- declaracao do modulo e dos dados que serao exportados
module Solidos (Solido(Esf, Cilindro, Cone, TroncoCone, EsfObl, EsfPro),
                Raio, Altura, area, volume) where

-- possibilidades do que o Solido pode ser com seus atributos
-- Show para que o sistema retorne os valores dos tipos de dados definidos
data Solido = Esf Raio -- esfera
            | Cilindro Raio Altura
            | Cone Raio Altura
            | TroncoCone Raio Raio Altura
            | EsfObl Raio Raio -- esferoide oblato
            | EsfPro Raio Raio -- esferoide prolato
            deriving Show

-- definicao dos tipos
type Raio = Float
type Altura = Float

-- funcao auxiliar que calcula excentricidade
excen :: Raio -> Raio -> Float
excen a b = sqrt(a^2 + b^2) / a

-- funcao que calcula area
area :: Solido -> Float
area(Esf r) = 4 * pi * r * r
area(Cilindro r h) = (2 * pi * r * h) + (2 * pi * r * r)
area(Cone r h) = (pi * r) * ((sqrt(r * r  + h * h)) + r)
area(TroncoCone r1 r2 h) = (pi * r1 * r1) + (pi * r2 * r2) + pi * (r1 + r2) *(sqrt(h * h + (r1 - r2)^2))
area(EsfObl a b) = (2 * pi * a^2) + ((b^2 / excen a b) * log((1 + excen a b)/(1 - excen a b)))
area(EsfPro a b) = (2 * pi * b^2) + (2 * pi * ((a * b) / excen a b)) * (asin(excen a b))

-- funcao que calcula volume
volume :: Solido -> Float
volume(Esf r) = (4 / 3) * (pi * r^3)
volume(Cilindro r h) = pi * h * r^2
volume(Cone r h) = (1 / 3) * pi * h * r^2
volume(TroncoCone r1 r2 h) = (1 / 3) * pi * h * (r1^2 + r2^2 + r1 * r2)
volume(EsfObl a b) = (4 / 3) * pi * b * a^2
volume(EsfPro a b) = (4 / 3) * pi * a * b^2
