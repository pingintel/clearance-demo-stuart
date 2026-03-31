import { Navigate, Route, Routes } from 'react-router-dom'
import { ClearancePage } from './pages/ClearancePage'

function App() {
  return (
    <Routes>
      <Route path="/" element={<ClearancePage />} />
      <Route path="/clearance" element={<ClearancePage />} />
      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  )
}

export default App
