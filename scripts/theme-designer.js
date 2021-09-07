import { Selector } from 'testcafe';
fixture`TU-03-1002-100: Design ► Theme Designer — All tests related to applying the custom CSS`
        .disablePageReloads
	.page('https://planet9dev.neptune-software.com:8081/cockpit.html#development-themedesigner')
	.beforeEach(async t => {
            await t.maximizeWindow();
            const inUsername  = Selector("input", { timeout: 10000 }).withAttribute("id", /.*(Login|User)Name.*/gi).filterVisible();
    	    const inPassword = Selector("div").withAttribute("id", /.*Password.*/gi).find("input").filterVisible();
	    await t.typeText(inUsername, 'testcafe', {paste: true});
	    await t.typeText(inPassword, 'testcafePassword', {paste: true});
	    await t.pressKey("enter");
        });

const imgLogo = Selector("#toolHeaderImage", { timeout: 10000 }).filterVisible();
const monacoEditor = Selector('div#oApp', { timeout: 10000 }).find('.inputarea');
const headerTitle = Selector('span', { timeout: 20000 }).withAttribute('id', /.*oPageHeaderTitle-inner/).withText('Theme Designer').filterVisible();
const butAdd = Selector('button', { timeout: 10000 }).withAttribute('id', /.*toolStartCreate/).filterVisible();
const tabCSS = Selector("div[role='tab']", { timeout: 10000 }).withAttribute('id', /.*tabHeadCSS/).filterVisible();
test(`Theme Designer`, async t => {
	await t
		.click(butAdd)
		.click(tabCSS)
		.expect(monacoEditor.exists).ok();

});
