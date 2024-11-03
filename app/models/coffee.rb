class Coffee < ApplicationRecord
  #This add a enum
  enum estado: { resuelto: 'resuelto', procesando: 'procesando', pendiente: 'pendiente' }
end
