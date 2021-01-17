I18n::Backend::Simple.include(I18n::Backend::Pluralization)

I18n.backend.store_translations :ja, i18n: { plural: { rule: ->(_n) { :other } } }

# Available locales
I18n.available_locales = %i[en ja]
