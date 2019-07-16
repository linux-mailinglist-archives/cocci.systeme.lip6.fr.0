Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 722536EEE2
	for <lists+cocci@lfdr.de>; Sat, 20 Jul 2019 11:55:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6K9tGiB021721;
	Sat, 20 Jul 2019 11:55:17 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id CE9DD7792;
	Sat, 20 Jul 2019 11:55:16 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 16A17749D
 for <cocci@systeme.lip6.fr>; Tue, 16 Jul 2019 04:36:14 +0200 (CEST)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20:0:0:0:530] (may be forged))
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6G2aDqW023965
 for <cocci@systeme.lip6.fr>; Tue, 16 Jul 2019 04:36:13 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id i11so17454206edq.0
 for <cocci@systeme.lip6.fr>; Mon, 15 Jul 2019 19:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Yi6MD/C0mLdc/IsS/hiXLySGwlw6MYsMPyRVuGabrl0=;
 b=Oho7A7+wcWNb3fpOD6SevXYg0UKpvElFCTH/nkh8Fqgi5g8fMKxfyE8l1as40Xt+Fv
 G/QSw9f2Dihj4NCS9Iey1GCLqety3HKE/qGn8AZA2kX3nb5BEWbZKAskPWeYVzPCAniM
 3ESmIdbAVKzuHyMQ5DKH36jiBSL2+Cer1EzQR6y9MD8anm/PbBxwmYO8nyVtQKE/f2GL
 EefGYs95K01uV6dakt/W1CJHq0QKQbxL0mj2gcPAuYr9Ft/aGoN1Bwbt6pgSF+OUixGj
 +Vv4yMuFou+mbCs7PF62xT4y237ZAlTO24IGvS8UQYpxjkx0YKLCxuCHK/0p36ZWf8FY
 wqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Yi6MD/C0mLdc/IsS/hiXLySGwlw6MYsMPyRVuGabrl0=;
 b=ldwYF0Z359Ti4iEOB1NZFotSxi0ygvJhmNLTpgfpuJVEJhi1D+9CNledl8J0kO6qJB
 BKylmuNOLnxcyN07i+fh506/6aVn0w0awcI0dNAXtbS6u9+tNnGoJ6hcgoShYngpVy3D
 BQYdlu207nkCqbcf/M4hcF4qmLT0sHZEVGuH133EgW3SPy7qf2927PfYF5EhtFpsc1gI
 /VoljbojoEUgFG2YBxM1qDix5+poiCOjiC/bwtV35TGL7pRaaAKIqZNS8SNufeqb7ldy
 DWRehuoZ1I9/mvkiLfbhJw8DAgtpu8O3tFFOXjjD9x8oHBKbnXImWKxoHPdbJ8lRCGVB
 XoLw==
X-Gm-Message-State: APjAAAVg9EgWTsd0Nxe8tSZzWowtXEvXJ+JqJnpBU3Ei9ylRdy2JVcve
 /N8e8ecUCxpe/Fi7pzdpF0dr9cIbYUpIojH13pSuGFog
X-Google-Smtp-Source: APXvYqzuZjpnIK1ws6s/yi5mGFGPTnnBmzo2Z77j4siWKL54Qja416NBzWMLfMrUsYTs/RDEQHCMv9q37q+0gxI+9JQ=
X-Received: by 2002:aa7:ca41:: with SMTP id j1mr27275320edt.149.1563244573423; 
 Mon, 15 Jul 2019 19:36:13 -0700 (PDT)
MIME-Version: 1.0
From: Will Lester <hslester96@gmail.com>
Date: Tue, 16 Jul 2019 10:36:02 +0800
Message-ID: <CANhBUQ3cx0Vr5XCBbYnuwvDR5G0BqV6o3rocmP_HWeTwEW__7g@mail.gmail.com>
To: cocci@systeme.lip6.fr
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 20 Jul 2019 11:55:19 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 16 Jul 2019 04:36:13 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
X-Mailman-Approved-At: Sat, 20 Jul 2019 11:55:14 +0200
Subject: [Cocci] How to write a pattern which crosses two functions?
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0323882737=="
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

--===============0323882737==
Content-Type: multipart/alternative; boundary="0000000000007efc73058dc33dc2"

--0000000000007efc73058dc33dc2
Content-Type: text/plain; charset="UTF-8"

Hello,
I want to write a script to solve problems of such pattern.
func_a () {
    x = .*alloc();
}
func_b () {
    foo(..., x, ...);
}
That is, a variable x is allocated by func_a and used by func_b in a file.
I wrote a script like this:
fn_a (...) {
...
- X = fn1(...);
...
}
...
fn_b (...) {
...
- fn2 (..., X, ...);
...
}
But an error was reported between two functions, "..." cannot be used there.
Therefore, what is the correct solution to this problem?

Thanks,
Will

--0000000000007efc73058dc33dc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>I want to write a script to solve pr=
oblems of such pattern.</div><div>func_a () {</div><div>=C2=A0=C2=A0=C2=A0 =
x =3D .*alloc();<br></div><div>}</div><div>func_b () {</div><div>=C2=A0=C2=
=A0=C2=A0 foo(..., x, ...);<br></div><div>}</div><div>That is, a variable x=
 is allocated by func_a and used by func_b in a file. <br></div><div>I wrot=
e a script like this:</div><div>fn_a (...) {</div><div>...</div><div>- X =
=3D fn1(...);</div><div>...<br></div><div>}</div><div>...</div><div>fn_b (.=
..) {</div><div>...</div><div>- fn2 (..., X, ...);</div><div>...<br></div><=
div>}</div><div>But an error was reported between two functions, &quot;...&=
quot; cannot be used there.</div><div>Therefore, what is the correct soluti=
on to this problem?</div><div><br></div><div>Thanks,</div><div>Will<br></di=
v></div>

--0000000000007efc73058dc33dc2--

--===============0323882737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--===============0323882737==--
