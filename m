Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6394CEC8E4
	for <lists+cocci@lfdr.de>; Fri,  1 Nov 2019 20:09:58 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA1J9b0s023482;
	Fri, 1 Nov 2019 20:09:37 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8B3A677C0;
	Fri,  1 Nov 2019 20:09:37 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id DC9DA454C
 for <cocci@systeme.lip6.fr>; Fri,  1 Nov 2019 20:09:34 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA1J9Yee005459
 for <cocci@systeme.lip6.fr>; Fri, 1 Nov 2019 20:09:34 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,256,1569276000"; d="scan'208";a="325343920"
Received: from abo-45-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.45])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Nov 2019 20:09:21 +0100
Date: Fri, 1 Nov 2019 20:09:21 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: =?ISO-8859-2?Q?Ond=F8ej_Sur=FD?= <ondrej@sury.org>
In-Reply-To: <D63C6B6A-C481-4A09-8EFF-D2760E9B85A8@sury.org>
Message-ID: <alpine.DEB.2.21.1911012003140.2883@hadrien>
References: <D63C6B6A-C481-4A09-8EFF-D2760E9B85A8@sury.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-715980136-1572635361=:2883"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 01 Nov 2019 20:09:38 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Fri, 01 Nov 2019 20:09:34 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Detecting functions with dummy return value
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-715980136-1572635361=:2883
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 1 Nov 2019, Ondřej Surý wrote:

> Hi,
>
> we changed our allocator (wrapper) function to assert() instead of returning ISC_R_MEMORY.
>
> As you can imagine there’s a lot of checks down the road that needs to be cleaned up,
> so I am looking for a way to detect function that only does:
>
> isc_result_t
> foo(…) {
>
> …
> return (ISC_R_SUCCESS);
> }
>
> it could possibly be:
>
> isc_result_t
> foo(…) {
> …
> return (ISC_R_SUCCESS);
> …
> return (ISC_R_SUCCESS);
> }

This is not possible.  ... describes control-flow paths.  Nothing happens
after a return.  Your attempt above would match functions where all
control-flow paths end with return (ISC_R_SUCCESS);, even if some of those
returns are in if branches.

For the case where ISC_R_SUCCESS is in a variable, you could try:

@@
expression E;
identifier foo;
@@

isc_result_t
foo(...) {
... when any
(
-return (ISC_R_SUCCESS);
+return;
|
E = ISC_R_SUCCESS;
...
(
-return (E);
+return;
|
return (ISC_R_SUCCESS);
)
}

julia


>
> Looking at badcheck.cocci, it looks like I just need a block that would „match“ such functions,
> but I can’t find a solid example on how to write a patch that would express:
>
> Mark functions that just return ISC_R_SUCCESS and nothing else:
>
> Something like this:
>
> @match_rule@
> expression E;
> @@
>
> <+... when != E != ISC_R_SUCCESS;
> return (E);
> ...+>
>
> @depends on match_rule@
> @@
>
> - return(...);
> + return;
>
> But that doesn’t work for me, it matches all return()s.
>
> Thanks,
> Ondrej
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-715980136-1572635361=:2883
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-715980136-1572635361=:2883--
