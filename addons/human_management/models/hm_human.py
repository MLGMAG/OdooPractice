from odoo import models, fields

class HumanManagementHuman(models.Model):
    _name = 'human_management.human'
    _description = 'Human record'

    human_name = fields.Char(string='Name', required=True) 
    human_age = fields.Integer(string='Age') 
    human_description = fields.Text(string='Description') 
    human_image = fields.Binary(string='Image') 

