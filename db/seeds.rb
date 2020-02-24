# Create admin user

admin = User.find_or_initialize_by(name: 'admin', email: 'admin@localhost.com', role: 'admin', status: 'active')
admin.password = '123456'
admin.password_confirmation = '123456'
admin.save
