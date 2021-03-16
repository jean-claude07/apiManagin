# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_16_182239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token", limit: 35
    t.text "pdpadmin"
    t.index ["authentication_token"], name: "index_admins_on_authentication_token", unique: true
  end

  create_table "annonces", force: :cascade do |t|
    t.string "contact"
    t.string "poste"
    t.string "email"
    t.string "reference"
    t.string "etablisment"
    t.string "contrat"
    t.string "province"
    t.string "libelle"
    t.string "pretention"
    t.text "description"
    t.string "date_limite"
    t.bigint "recruteur_id"
    t.text "profil_rechercher"
    t.string "client"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "annoncephoto"
    t.index ["recruteur_id"], name: "index_annonces_on_recruteur_id"
  end

  create_table "candidatprofiles", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "telephone"
    t.string "email"
    t.string "password_digest"
    t.string "string"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "pdpcandidat"
    t.text "authentication_token"
    t.index ["authentication_token"], name: "index_candidatprofiles_on_authentication_token", unique: true
  end

  create_table "chauffeurs", force: :cascade do |t|
    t.string "contact1"
    t.string "contact2"
    t.string "categorie_permis"
    t.string "nom"
    t.string "prenom"
    t.string "brith"
    t.string "club"
    t.string "adresse"
    t.string "ville"
    t.bigint "candidatprofile_id"
    t.string "province"
    t.string "fumeur"
    t.string "alcolique"
    t.string "marie"
    t.string "nombre_enfant"
    t.string "port_lunette"
    t.string "annee_de_debut"
    t.string "salaire_envisager"
    t.string "disponible"
    t.string "observation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "photo"
    t.text "permis"
    t.text "cv"
    t.index ["candidatprofile_id"], name: "index_chauffeurs_on_candidatprofile_id"
  end

  create_table "choixquestiondebutants", force: :cascade do |t|
    t.string "choix"
    t.bigint "questiondebutant_id"
    t.index ["questiondebutant_id"], name: "index_choixquestiondebutants_on_questiondebutant_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "nom"
    t.string "email"
    t.string "subject"
    t.text "message"
    t.string "telephone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "info_recruteurs", force: :cascade do |t|
    t.string "adress"
    t.string "type"
    t.text "details"
    t.bigint "recruteur_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recruteur_id"], name: "index_info_recruteurs_on_recruteur_id"
  end

  create_table "plusinfos", force: :cascade do |t|
    t.string "adresse"
    t.string "etude"
    t.text "experience"
    t.bigint "candidatprofile_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidatprofile_id"], name: "index_plusinfos_on_candidatprofile_id"
  end

  create_table "questiondebutants", force: :cascade do |t|
    t.string "question"
  end

  create_table "recruteurs", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "telephone"
    t.string "entreprise"
    t.string "email"
    t.string "password_digest"
    t.string "other"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "pdprecruteur"
    t.string "authentication_token", limit: 32
    t.index ["authentication_token"], name: "index_recruteurs_on_authentication_token", unique: true
  end

  create_table "reponsequestiondebutants", force: :cascade do |t|
    t.string "reponse"
    t.bigint "questiondebutant_id"
    t.index ["questiondebutant_id"], name: "index_reponsequestiondebutants_on_questiondebutant_id"
  end

end
