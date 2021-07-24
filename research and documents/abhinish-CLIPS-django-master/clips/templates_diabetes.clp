; ; Templates
; ; Template to represent "dish".
(deftemplate dish
  (slot ID (type NUMBER))
  (slot name (type STRING))
  (slot cuisine (type STRING))
  (slot is-vegetarian (type STRING))
  (slot calorie-level (type STRING))
  (slot fiber-level (type STRING))
  (slot fat-level (type STRING))
  (slot carb-level (type STRING))
  
)

; ; Template to represent user's preference.
(deftemplate preference
  (slot cuisine (type STRING))
  (slot is-vegetarian (type STRING))
  (slot calorie-level (type STRING))
  (slot fiber-level (type STRING))
  (slot fat-level (type STRING))
  (slot carb-level (type STRING))
)




; ; Template to represent user's suggestions (for fine-tuning dishes).
(deftemplate suggestion
  (slot dish-name (type STRING))
  (slot dish-id (type NUMBER))
  (slot attribute (type STRING))
  (slot value (type STRING))
  (slot quantity (type NUMBER))
)
