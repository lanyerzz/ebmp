package com.app.ywms.kc



import org.junit.*
import grails.test.mixin.*

@TestFor(YonhandnumController)
@Mock(Yonhandnum)
class YonhandnumControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/yonhandnum/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.yonhandnumInstanceList.size() == 0
        assert model.yonhandnumInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.yonhandnumInstance != null
    }

    void testSave() {
        controller.save()

        assert model.yonhandnumInstance != null
        assert view == '/yonhandnum/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/yonhandnum/show/1'
        assert controller.flash.message != null
        assert Yonhandnum.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/yonhandnum/list'

        populateValidParams(params)
        def yonhandnum = new Yonhandnum(params)

        assert yonhandnum.save() != null

        params.id = yonhandnum.id

        def model = controller.show()

        assert model.yonhandnumInstance == yonhandnum
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/yonhandnum/list'

        populateValidParams(params)
        def yonhandnum = new Yonhandnum(params)

        assert yonhandnum.save() != null

        params.id = yonhandnum.id

        def model = controller.edit()

        assert model.yonhandnumInstance == yonhandnum
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/yonhandnum/list'

        response.reset()

        populateValidParams(params)
        def yonhandnum = new Yonhandnum(params)

        assert yonhandnum.save() != null

        // test invalid parameters in update
        params.id = yonhandnum.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/yonhandnum/edit"
        assert model.yonhandnumInstance != null

        yonhandnum.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/yonhandnum/show/$yonhandnum.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        yonhandnum.clearErrors()

        populateValidParams(params)
        params.id = yonhandnum.id
        params.version = -1
        controller.update()

        assert view == "/yonhandnum/edit"
        assert model.yonhandnumInstance != null
        assert model.yonhandnumInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/yonhandnum/list'

        response.reset()

        populateValidParams(params)
        def yonhandnum = new Yonhandnum(params)

        assert yonhandnum.save() != null
        assert Yonhandnum.count() == 1

        params.id = yonhandnum.id

        controller.delete()

        assert Yonhandnum.count() == 0
        assert Yonhandnum.get(yonhandnum.id) == null
        assert response.redirectedUrl == '/yonhandnum/list'
    }
}
