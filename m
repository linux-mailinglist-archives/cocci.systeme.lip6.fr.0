Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3EFB764B
	for <lists+cocci@lfdr.de>; Thu, 19 Sep 2019 11:29:56 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8J9Tbqc002102;
	Thu, 19 Sep 2019 11:29:37 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B513877AB;
	Thu, 19 Sep 2019 11:29:37 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A0763779D
 for <cocci@systeme.lip6.fr>; Thu, 19 Sep 2019 11:29:36 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8J9Tak0008672
 for <cocci@systeme.lip6.fr>; Thu, 19 Sep 2019 11:29:36 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,523,1559512800"; d="scan'208";a="319933628"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 11:29:35 +0200
Date: Thu, 19 Sep 2019 11:29:34 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <fdbb1d27-ab5b-1b96-82f6-a89c59d17cdd@web.de>
Message-ID: <alpine.DEB.2.21.1909191129040.2621@hadrien>
References: <alpine.DEB.2.21.1909182110530.2753@hadrien>
 <fdbb1d27-ab5b-1b96-82f6-a89c59d17cdd@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-396028239-1568885375=:2621"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 19 Sep 2019 11:29:38 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Thu, 19 Sep 2019 11:29:36 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Compiling with OCaml 4.09
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

--8323329-396028239-1568885375=:2621
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 19 Sep 2019, Markus Elfring wrote:

> > The version in github should now compile with 4.08.
>
> This is another nice improvement. Thank you.
>
> I have generated the software combination “Coccinelle 1.0.7-00238-ge291d096”
> based on the OPAM switch “4.09.0” for my development system a moment ago.
> This software generation pointed the following information out
> for further considerations.
>
> Alert deprecated: module Stdlib.Pervasives
> Use Stdlib instead.

Thank you for the test.  Since this appears to be just a warning, I thik I
will make a release anyway.

julia
--8323329-396028239-1568885375=:2621
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-396028239-1568885375=:2621--
