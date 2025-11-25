# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_11_25_024614) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "condiciones_cronicas", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dias", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donaciones", force: :cascade do |t|
    t.integer "user_id"
    t.integer "donante_id"
    t.integer "solicitud_id"
    t.integer "ubicacion_id"
    t.date "fecha_donacion"
    t.integer "volumen_ml"
    t.string "tipo_sangre"
    t.integer "verificado_por_usuario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "postulacion_id", null: false
    t.index ["postulacion_id"], name: "index_donaciones_on_postulacion_id"
  end

  create_table "donantes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "tipo_sanguineo"
    t.float "peso_kg"
    t.float "estatura_cm"
    t.boolean "tiene_tatuajes"
    t.date "ult_donacion_fecha"
    t.boolean "ult_donacion_verificado", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_donantes_on_user_id"
  end

  create_table "donantes_condiciones", force: :cascade do |t|
    t.integer "donante_id"
    t.integer "condicion_cronica_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donantes_medicamentos", force: :cascade do |t|
    t.integer "donante_id"
    t.integer "medicamento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horarios", force: :cascade do |t|
    t.integer "ubicacion_id"
    t.integer "dia_id"
    t.time "abre_a"
    t.time "cierra_a"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicamentos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descripcion"
  end

  create_table "postulaciones", force: :cascade do |t|
    t.integer "user_id"
    t.integer "solicitud_id"
    t.integer "ubicacion_id"
    t.date "fecha_tentativa"
    t.time "hora_tentativa"
    t.string "estado", default: "P"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solicitudes", force: :cascade do |t|
    t.integer "user_id"
    t.string "nombre_paciente"
    t.string "cin_paciente"
    t.string "tipo_sangre"
    t.integer "location_id"
    t.integer "donantes_requeridos"
    t.text "detalles"
    t.string "estado", default: "pendiente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ubicaciones", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.string "num_telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_ubicaciones_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.string "nombredeusuario"
    t.string "rol"
    t.string "num_telefono"
    t.date "fec_nacimiento"
    t.string "direccion"
    t.string "genero"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "donaciones", "donantes"
  add_foreign_key "donaciones", "postulaciones"
  add_foreign_key "donaciones", "solicitudes"
  add_foreign_key "donaciones", "ubicaciones", column: "ubicacion_id"
  add_foreign_key "donaciones", "users"
  add_foreign_key "donaciones", "users", column: "verificado_por_usuario"
  add_foreign_key "donantes", "users"
  add_foreign_key "donantes_condiciones", "condiciones_cronicas", column: "condicion_cronica_id"
  add_foreign_key "donantes_condiciones", "donantes"
  add_foreign_key "donantes_medicamentos", "donantes"
  add_foreign_key "donantes_medicamentos", "medicamentos"
  add_foreign_key "horarios", "dias"
  add_foreign_key "horarios", "ubicaciones", column: "ubicacion_id"
  add_foreign_key "postulaciones", "solicitudes"
  add_foreign_key "postulaciones", "ubicaciones", column: "ubicacion_id"
  add_foreign_key "postulaciones", "users"
  add_foreign_key "solicitudes", "ubicaciones", column: "location_id"
  add_foreign_key "solicitudes", "users"
  add_foreign_key "ubicaciones", "users"
end
