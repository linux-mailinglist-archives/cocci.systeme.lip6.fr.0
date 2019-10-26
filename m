Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D83AE5A7B
	for <lists+cocci@lfdr.de>; Sat, 26 Oct 2019 14:45:56 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9QCjVEK006554;
	Sat, 26 Oct 2019 14:45:31 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B05E177CE;
	Sat, 26 Oct 2019 14:45:31 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B412877B4
 for <cocci@systeme.lip6.fr>; Sat, 26 Oct 2019 14:45:29 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9QCjTbo024255
 for <cocci@systeme.lip6.fr>; Sat, 26 Oct 2019 14:45:29 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.68,232,1569276000"; d="scan'208";a="324485668"
Received: from ip-121.net-89-2-166.rev.numericable.fr (HELO hadrien)
 ([89.2.166.121])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Oct 2019 14:45:18 +0200
Date: Sat, 26 Oct 2019 14:45:17 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <d7b9c6d8-8b67-2a05-188b-0b1b6b7ebc2a@web.de>
Message-ID: <alpine.DEB.2.21.1910261444480.2764@hadrien>
References: <384c6657-5ddc-ff47-14e2-2ffad31295d2@web.de>
 <d7b9c6d8-8b67-2a05-188b-0b1b6b7ebc2a@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1502002377-1572093918=:2764"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 26 Oct 2019 14:45:34 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Sat, 26 Oct 2019 14:45:29 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking placement of spaces for code changes with SmPL
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

--8323329-1502002377-1572093918=:2764
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sat, 26 Oct 2019, Markus Elfring wrote:

> > But I find the source code formatting occasionally questionable
> > according to the Linux coding style.
>
> elfring@Sonne:~/Projekte/Coccinelle/Probe> spatch ../janitor/use_array_size_for_kmemdup2.cocci task_test6.c
> …
> @@ -1,6 +1,6 @@
>  void* my_task(void)
>  {
>  void* copy;
> -copy = kmemdup(ohs, sizeof(struct omap_hwmod *) * oh_cnt, GFP_KERNEL);
> +copy = kmemdup(ohs,array_size( sizeof(*ohs), oh_cnt), GFP_KERNEL);
>  return copy;
>  }
>
>
> How would you like to clarify pretty-printing concerns?

I would need the semantic patch to understand the problem.

julia


>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-1502002377-1572093918=:2764
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1502002377-1572093918=:2764--
