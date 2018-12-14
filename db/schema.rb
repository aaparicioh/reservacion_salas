# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181022233453) do

  create_table "agendas", force: :cascade do |t|
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "espacios", force: :cascade do |t|
    t.string "nombre"
    t.string "ubicacion"
    t.integer "aforo"
    t.string "descripcion"
    t.text "servicios_adicionales"
    t.string "estatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservacions", force: :cascade do |t|
    t.string "nresponsable"
    t.string "nevento"
    t.date "fechainicio"
    t.date "fechafin"
    t.time "horainicio"
    t.time "horafin"
    t.boolean "repeticion"
    t.string "idrepeticiones"
    t.boolean "aprobacion"
    t.string "tipoactividad"
    t.datetime "fechasolicitud"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "cartel"
    t.integer "ncartel"
    t.boolean "programa"
    t.integer "nprograma"
    t.boolean "constancias"
    t.integer "nconstancias"
    t.boolean "mesaRedonda"
    t.boolean "auditorio"
    t.boolean "videoproyector"
    t.boolean "pc"
    t.boolean "video"
    t.boolean "conexInternet"
    t.boolean "traducSimultanea"
    t.boolean "conexSkype"
    t.boolean "videoconferencia"
    t.boolean "webcast"
    t.boolean "grabVideo"
    t.boolean "grabAudio"
    t.boolean "cafe"
    t.boolean "galletas"
    t.boolean "fruta"
    t.integer "asistentes"
    t.boolean "pizarron"
    t.string "disposicion"
    t.string "usuario"
    t.integer "espacio_id"
  end

  create_table "solicituds", force: :cascade do |t|
    t.string "sala"
    t.string "responsable"
    t.string "motivo"
    t.string "sesiones"
    t.string "fechainicio"
    t.string "fechafin"
    t.string "diasemana"
    t.string "horario"
    t.string "numpersonas"
    t.string "requerimientos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "usuario"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nick"
    t.string "pass"
    t.string "nombre"
    t.string "appat"
    t.string "apmat"
    t.string "tipo_usuario"
    t.integer "autorizado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videoconferencia", force: :cascade do |t|
    t.string "nSolicitante"
    t.string "tituloActividad"
    t.date "fechaActividad"
    t.string "coordinador"
    t.string "tipoEnlace"
    t.time "horainicio"
    t.time "horafin"
    t.string "coordinadorEnlace"
    t.string "responsableTecnico"
    t.string "numeroIP"
    t.string "usuarioTipoEnlace"
    t.string "telefono"
    t.string "correoElectronico"
    t.string "recursos"
    t.time "horainicioEnlace"
    t.time "horafinEnlace"
    t.datetime "fechaSolicitud"
    t.string "usuario"
    t.boolean "aprobacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
