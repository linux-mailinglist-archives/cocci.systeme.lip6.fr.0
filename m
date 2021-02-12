Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5DB319AE0
	for <lists+cocci@lfdr.de>; Fri, 12 Feb 2021 08:52:13 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11C7pf81008122;
	Fri, 12 Feb 2021 08:51:41 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id F1DF777DD;
	Fri, 12 Feb 2021 08:51:40 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6CD0B3B26
 for <cocci@systeme.lip6.fr>; Fri, 12 Feb 2021 08:34:14 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11C7YCJh018970
 for <cocci@systeme.lip6.fr>; Fri, 12 Feb 2021 08:34:13 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2F6E64DDF;
 Fri, 12 Feb 2021 07:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1613115251;
 bh=neLigVsdoN+CYxyJjxX/qAVzIuWLkdZyDMtjMwYqrLI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HXxvvzoLkjPDeR3JvcBQ0yM6umQwZkmsCLbD2ensoMiDSwJ12mr5vWKrB0DrZiHW7
 Gekvt4dNU/S+p5AIGSg4dt+0WYDyTcu/6XVXII5HxZO1gqLk/3yDI3Wlulmpn0zOJp
 7rgsu6cSkxMG72w51fu99lYoEdiG5ZacmY648UG0=
Date: Fri, 12 Feb 2021 08:34:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <YCYvcUNiPoG/ipyj@kroah.com>
References: <20210211232745.1498137-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210211232745.1498137-1-robh@kernel.org>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 12 Feb 2021 08:51:43 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 12 Feb 2021 08:34:13 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Fri, 12 Feb 2021 08:51:38 +0100
Cc: cocci@systeme.lip6.fr, devicetree@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Patrice Chotard <patrice.chotard@st.com>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
        netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [Cocci] [PATCH v2 0/2] of: of_device.h cleanups
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

On Thu, Feb 11, 2021 at 05:27:43PM -0600, Rob Herring wrote:
> This is a couple of cleanups for of_device.h. They fell out from my
> attempt at decoupling of_device.h and of_platform.h which is a mess
> and I haven't finished, but there's no reason to wait on these.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
