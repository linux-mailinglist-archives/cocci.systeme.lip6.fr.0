Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 981AFFF962
	for <lists+cocci@lfdr.de>; Sun, 17 Nov 2019 13:21:41 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAHCLRG4025709;
	Sun, 17 Nov 2019 13:21:27 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 115D577D7;
	Sun, 17 Nov 2019 13:21:27 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 50DA37705
 for <cocci@systeme.lip6.fr>; Sun, 17 Nov 2019 13:21:25 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAHCLOR1029252
 for <cocci@systeme.lip6.fr>; Sun, 17 Nov 2019 13:21:24 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,316,1569276000"; d="scan'208";a="327008752"
Received: from abo-228-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.228])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Nov 2019 13:21:24 +0100
Date: Sun, 17 Nov 2019 13:21:23 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <87018ba7-e8ac-8b46-e082-c0c9ecc20624@web.de>
Message-ID: <alpine.DEB.2.21.1911171320530.2641@hadrien>
References: <87018ba7-e8ac-8b46-e082-c0c9ecc20624@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1979877710-1573993284=:2641"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 17 Nov 2019 13:21:27 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Sun, 17 Nov 2019 13:21:24 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking size determinations with SmPL
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

--8323329-1979877710-1573993284=:2641
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sun, 17 Nov 2019, Markus Elfring wrote:

> Hello,
>
> The following code example gets accepted by the Coccinelle software.
>
> @display1@
> expression* e;
> type t;
> @@
> *\( sizeof(t) \| sizeof(*e) \)
>
>
> Would it be nice if another script variant can work together with
> such a SmPL disjunction also in this way?

No.  They are quite different because the () is required on a type but
optional on an expression.

julia

>
> @display2@
> expression* e;
> type t;
> @@
> *sizeof( \( t \| *e \) )
>
>
> elfring@Sonne:~/Projekte/Coccinelle/Probe> spatch --parse-cocci check_sizeof2.cocci
> …
> minus: parse error:
>   File "check_sizeof2.cocci", line 5, column 17, charpos = 54
>   around = '*',
>   whole content = *sizeof( \( t \| *e \) )
>
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-1979877710-1573993284=:2641
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1979877710-1573993284=:2641--
