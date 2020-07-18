Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5458F224B89
	for <lists+cocci@lfdr.de>; Sat, 18 Jul 2020 15:30:17 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06IDU1c8001206;
	Sat, 18 Jul 2020 15:30:01 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D2C377815;
	Sat, 18 Jul 2020 15:30:01 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3A4D23F6C
 for <cocci@systeme.lip6.fr>; Sat, 18 Jul 2020 15:30:00 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06IDTxlY027689
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 18 Jul 2020 15:29:59 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,367,1589234400"; d="scan'208";a="460306961"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2020 15:29:58 +0200
Date: Sat, 18 Jul 2020 15:29:58 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <cf2bd604-3094-f90a-52a8-ff5a44cf3850@linux.com>
Message-ID: <alpine.DEB.2.22.394.2007181529460.2538@hadrien>
References: <0b9f2c58-e124-22d2-d91d-62a6e831c880@web.de>
 <alpine.DEB.2.22.394.2007180841520.2538@hadrien>
 <cf2bd604-3094-f90a-52a8-ff5a44cf3850@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 18 Jul 2020 15:30:02 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 18 Jul 2020 15:29:59 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Markus Elfring <Markus.Elfring@web.de>, Coccinelle <cocci@systeme.lip6.fr>,
        linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [v2 1/4] coccinelle: api: extend memdup_user
 transformation with GFP_USER
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr



On Sat, 18 Jul 2020, Denis Efremov wrote:

> Hi,
>
> On 7/18/20 9:45 AM, Julia Lawall wrote:
> > This on is indeed a problem.  I think it was not detected in testing,
> > because in the current kernel the rule never applies.  But Denis, in
> >
> > -  to = \(kmalloc\|kzalloc\)
> >                 (size,\(GFP_KERNEL\|GFP_USER\|
> >                       \(GFP_KERNEL\|GFP_USER\)|__GFP_NOWARN\));
> >
> > you do indeed need to put - in front of the second and third lines as
> > well.
>
> Thanks, Markus, Julia. I will send v3. Julia, is it ok with you, if I will
> drop the last patch with "selfcheck" this time?

That would be perfect, thanks.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
