Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9142A1FD664
	for <lists+cocci@lfdr.de>; Wed, 17 Jun 2020 22:52:33 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05HKqIFi006838;
	Wed, 17 Jun 2020 22:52:18 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id AA53D781F;
	Wed, 17 Jun 2020 22:52:18 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id AD09D3D0F
 for <cocci@systeme.lip6.fr>; Wed, 17 Jun 2020 22:52:17 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05HKqHqn028535
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 17 Jun 2020 22:52:17 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,523,1583190000"; d="scan'208";a="351906721"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 22:52:16 +0200
Date: Wed, 17 Jun 2020 22:52:16 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <7c7b22f8-722c-60f5-db5d-290bea2b499c@linux.com>
Message-ID: <alpine.DEB.2.22.394.2006172252080.3083@hadrien>
References: <20200615102045.4558-1-efremov@linux.com>
 <alpine.DEB.2.22.394.2006172229550.3083@hadrien>
 <7c7b22f8-722c-60f5-db5d-290bea2b499c@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 17 Jun 2020 22:52:18 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 17 Jun 2020 22:52:17 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH] coccinelle: misc: add array_size_dup script to
 detect missed overlow checks
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



On Wed, 17 Jun 2020, Denis Efremov wrote:

>
>
> On 6/17/20 11:30 PM, Julia Lawall wrote:
> >
> >
> > On Mon, 15 Jun 2020, Denis Efremov wrote:
> >
> >> Detect an opencoded expression that is used before or after
> >> array_size()/array3_size()/struct_size() to compute the same size.
> >
> > This would benefit from the assignemnt operator metavariables as well.
> >
> > Also, it could be better to put the python rules up next the SmPL pattern
> > matching rules that they are associated with.
> >
>
> Thanks, I will send v2.
> Here is the KSPP ticket with patches https://github.com/KSPP/linux/issues/83

Thanks!

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
