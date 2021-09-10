// Copyright 2015 sms-api-server authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package apiserver

import (
	"testing"
	"time"

	"github.com/fiorix/go-smpp/v2/smpp/pdu"
	"github.com/fiorix/go-smpp/v2/smpp/pdu/pdufield"
)

func TestDeliveryStore(t *testing.T) {
	want := "delivery receipt"
	pool := newPool()
	id, dr := pool.Register()
	defer pool.Unregister(id)
	p := pdu.NewDeliverSM()
	f := p.Fields()
	f.Set(pdufield.SourceAddr, "bart")
	f.Set(pdufield.DestinationAddr, "lisa")
	f.Set(pdufield.ESMClass, nil)
	f.Set(pdufield.ShortMessage, want)
	pool.Handler(p)
	select {
	case r := <-dr:
		if r.Text != want {
			t.Fatalf("unexpected message: want %q, have %q",
				want, r.Text)
		}
	case <-time.After(2 * time.Second):
		t.Fatal("timeout waiting for delivery receipt")
	}
}
