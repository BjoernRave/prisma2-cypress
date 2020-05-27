it('should reset the db', async () => {
  cy.task('regenerate')

  cy.visit('https://google.com')
})
