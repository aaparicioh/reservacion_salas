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

ActiveRecord::Schema.define(version: 20170906152907) do

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

end
