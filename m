Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD0B4F02E
	for <lists+cocci@lfdr.de>; Fri, 21 Jun 2019 22:53:05 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5LKqOYU003731;
	Fri, 21 Jun 2019 22:52:24 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 13801778C;
	Fri, 21 Jun 2019 22:52:24 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 06279776C
 for <cocci@systeme.lip6.fr>; Fri, 21 Jun 2019 22:52:22 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5LKq2g2022588
 for <cocci@systeme.lip6.fr>; Fri, 21 Jun 2019 22:52:02 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,401,1557180000"; d="scan'208";a="388573149"
Received: from abo-12-105-68.mrs.modulonet.fr (HELO hadrien) ([85.68.105.12])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jun 2019 22:52:02 +0200
Date: Fri, 21 Jun 2019 22:52:02 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <f1bb347b-7318-f69f-ad86-bd633c72b375@web.de>
Message-ID: <alpine.DEB.2.21.1906212251430.2538@hadrien>
References: <f1bb347b-7318-f69f-ad86-bd633c72b375@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1986374773-1561150322=:2538"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 21 Jun 2019 22:52:26 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Fri, 21 Jun 2019 22:52:02 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking redundant variable initialisations with SmPL?
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

--8323329-1986374773-1561150322=:2538
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 20 Jun 2019, Markus Elfring wrote:

> Hello,
>
> A patch on a topic like “[next] lkdtm: remove redundant initialization of ret”
> caught also my software development attention.
> https://lkml.org/lkml/2019/6/14/265
> https://lore.kernel.org/patchwork/patch/1088971/
> https://lore.kernel.org/lkml/20190614094311.24024-1-colin.king@canonical.com/
>
>
> I hoped that the following script for the semantic patch language can point
> such an update candidate also out.
>
> @display@
> binary operator bo;
> expression e1, e2, e3;
> identifier var, work;
> statement is, es;
> type t;
> @@
> *t var = e1;
>  ... when != if (var bo e2) is else es
> *var =
> (      work(...)
> |      e3
> )
>
>
> elfring@Sonne:~/Projekte/Linux/next-patched> spatch ~/Projekte/Coccinelle/janitor/show_questionable_variable_initialisation1.cocci drivers/misc/lkdtm/core.c
> …
> exn while in timeout_function
> Fatal error: exception Coccinelle_modules.Common.Impossible(56)
>
>
> How do you think about the software situation?

This problem is now fixed.  Thank you for the report.

julia
--8323329-1986374773-1561150322=:2538
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1986374773-1561150322=:2538--
