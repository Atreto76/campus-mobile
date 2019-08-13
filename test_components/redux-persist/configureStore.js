import { createStore, applyMiddleware, compose } from 'redux'
import { persistStore, persistCombineReducers } from 'redux-persist'
import AsyncStorage from '@react-native-community/async-storage'
import logger from 'redux-logger'
import { createFilter } from 'redux-persist-transform-filter'
import createSagaMiddleware from 'redux-saga'

import rootReducer from '../../app/reducers/index'
import rootSaga from '../../app/sagas/rootSaga'


// you want to remove some keys before you save
const saveMapFilter = createFilter(
	'map',
	['history']
)
// empty vehicles
const saveShuttleFilter = createFilter(
	'shuttle',
	[
		'toggles',
		'routes',
		'stops',
		'closestStop',
		'lastUpdated',
		'savedStops',
	]
)

const persistConfig = {
	key: 'home',
	storage: AsyncStorage,
	transforms: [saveMapFilter, saveShuttleFilter]
}
// custom composer for redux devtools
const composeWithTools = 
	typeof window === 'object' && 
	window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ ? 
		window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__({}) : compose


const sagaMiddleware = createSagaMiddleware()

const enhancer =  composeWithTools(applyMiddleware(sagaMiddleware, logger))

const persistedReducer = persistCombineReducers(persistConfig, rootReducer)

const store = createStore(persistedReducer, enhancer)

const persistor = persistStore(store, null,(err, restoredState) => { store.getState() })

const storeAndPersistor = { store, persistor }

sagaMiddleware.run(rootSaga)

export default storeAndPersistor