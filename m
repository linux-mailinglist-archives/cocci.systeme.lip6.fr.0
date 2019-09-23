Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 099E9BB0FB
	for <lists+cocci@lfdr.de>; Mon, 23 Sep 2019 11:08:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8N98Wcl016088;
	Mon, 23 Sep 2019 11:08:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0098077B2;
	Mon, 23 Sep 2019 11:08:31 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E3EBF7796
 for <cocci@systeme.lip6.fr>; Mon, 23 Sep 2019 11:08:30 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8N98U7R014208
 for <cocci@systeme.lip6.fr>; Mon, 23 Sep 2019 11:08:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,539,1559512800"; d="scan'208";a="402946874"
Received: from unknown (HELO hadrien) ([65.39.69.237])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 10:59:20 +0200
Date: Mon, 23 Sep 2019 10:59:20 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <e07ce253-8a13-0f90-3ee0-79c1a0e78b38@web.de>
Message-ID: <alpine.DEB.2.21.1909231058380.2283@hadrien>
References: <e07ce253-8a13-0f90-3ee0-79c1a0e78b38@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-858564955-1569229160=:2283"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 23 Sep 2019 11:08:32 +0200 (CEST)
X-Greylist: Delayed for 00:09:09 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Mon, 23 Sep 2019 11:08:30 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Reducing source code around return statements with SmPL?
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

--8323329-858564955-1569229160=:2283
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Mon, 23 Sep 2019, Markus Elfring wrote:

> Hello,
>
> The following small script for the semantic patch language
> can point various source code places out for further considerations.
>
> @replacement@
> expression x;
> identifier rc;

Add: local idexpression lrc;

> @@
> -rc = x;

Replace by - lrc@rc = x;

julia

>  return
> -       rc
> +       x
>  ;
>
> @deletion@
> identifier replacement.rc;
> type t;
> @@
> -t rc;
>  ... when != rc
>
>
> Unfortunately, this source code transformation approach seems to be
> too generic. Places will be suggested for a change which should
> be kept untouched.
>
> The replacement of assignments should be restricted to local variables.
> I guess that the metavariable type “local idexpression” should work
> for this purpose.
> But I got the impression that its use triggers design challenges
> for the removal of a variable by an inherited metavariable in the
> second SmPL rule.
> Which adjustments should be taken better into account for this use case?
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-858564955-1569229160=:2283
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-858564955-1569229160=:2283--
