import { delay } from 'redux-saga'
import { put, call } from 'redux-saga/effects'
import { DATA_SAGA_TTL } from '../AppSettings'

function* watchData() {
	while (true) {
		try {
			// resides in userSaga.js
			// called by dataSaga.js
			yield put({ type: 'SYNC_USER_PROFILE' })
		} catch (err) {
			console.log(err)
		}
		yield delay(DATA_SAGA_TTL)
	}
}

function* dataSaga() {
	yield call(watchData)
}

export default dataSaga
