import { useAccount } from "wagmi";
import "./Home.css";
import { useState, useEffect } from "react";

enum States {
  Arrived,
  Connected,
  UsernameSet,
}

export default () => {
  const { address, isConnecting, isDisconnected } = useAccount();
  let state = States.Arrived;

  useEffect(() => {
    if (address === undefined) {
      state = States.Connected;
    }
  }, [address]);

  return (
    <main className="center">
      <h1 className="main-title">empires</h1>
      {state === States.Arrived && <Arrived />}

      {state}
      {isConnecting && "<div>Connecting…</div>"}
      {isDisconnected && "<div>Disconnected</div>"}
      <div>{address}</div>
    </main>
  );
};

const Arrived = () => (
  <>
    <div className="connect-button">
      <w3m-connect-button />
      {/* <w3m-account-button balance="hide" />
      <w3m-button balance="hide" /> */}
    </div>
  </>
);
