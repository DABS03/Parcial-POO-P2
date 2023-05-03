describe("Test suit- POO",()=>{

    beforeEach(()=>{
        cy.visit("http://127.0.0.1:8080/Parcial2DiegoBurgos/listar.jsp")    
})

it("Validar páginas", ()=>{   
    cy.get('a').should('be.visible')
    cy.get('h1').should('be.visible')
    cy.get('a').click() 
    cy.get('h1').should('be.visible')
    cy.get('form').should('be.visible')
    cy.get('#txtNombre').should('be.visible')
    cy.get('#txtApellido').should('be.visible')
    cy.get('#txtGenero').should('be.visible')
    cy.get('#txtFechaNacimiento').should('be.visible')
    cy.get('#txtEdad').should('be.visible')
    cy.get('#txtDireccion').should('be.visible')
    cy.get('#txtTelefono').should('be.visible')
    cy.get('#txtEmail').should('be.visible')
    cy.get('#txtCarnet').should('be.visible')
    cy.get('#txtPromedio').should('be.visible')
    cy.get('#txtPromedio').should('be.visible')
    cy.get('[type="submit"]').click()
    cy.get('body').should('be.visible')
    cy.get('body').contains("La edad del estudiante no es la suficiente.Regresar al formulario")
})
})